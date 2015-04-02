require 'date'

module AndreyTarantsov
module JekyllVersions

  class VersionReleaseNotesPage < Jekyll::Page
    def initialize(site, base, dir, version)
      @site = site
      @base = base
      @dir = dir
      @name = "LiveReload-#{version['version']}-rnotes.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'version_release_notes.html')
      self.data['version'] = version
    end
  end

  class Generator < Jekyll::Generator
    REFERENCE_CHANNELS = ['production']

    def generate(site)
      ['mac'].each do |platform|
        versions_by_channel = {}
        all_versions_by_channel = {}
        versions_compared_by_channel_by_reference_channel = {}
        last_encountered_versions_by_channel = {}

        all_versions = site.data["versions_#{platform}"]
        all_versions.each do |version|
          version['date_tm'] = version['date'].to_datetime.to_time.utc + 12*60*60
          version['encompassed_versions'] = []
          version['release_notes'] ||= []

          version['channels'].each do |channel_name, channel_enabled|
            next unless channel_enabled
            unless versions_by_channel.key? channel_name
              versions_by_channel[channel_name] = version
            end
            (all_versions_by_channel[channel_name] ||= []) << version
            last_encountered_versions_by_channel[channel_name] = version
          end

          version['channels'].each do |channel_name, channel_enabled|
            next unless channel_enabled
            REFERENCE_CHANNELS.each do |reference_channel_name|
              unless channel_name == reference_channel_name
                versions_compared_by_channel = (versions_compared_by_channel_by_reference_channel[reference_channel_name] ||= {})
                versions_until_reference = (versions_compared_by_channel[channel_name] ||= [])

                unless versions_by_channel.key? reference_channel_name
                  versions_until_reference << version
                end
              end
            end
          end

          if last_encountered_versions_by_channel['production']
            last_encountered_versions_by_channel['production']['encompassed_versions'] << version
          end
          # versions_by_channel.each do |other_channel_name, other_version|
          #   next unless other_channel_name == 'production'
          #   version['encompassed_versions'] << version
          # end
        end

        versions_by_channel.each do |channel_name, version|
          site.data["version_#{platform}_#{channel_name}"] = version
        end
        all_versions_by_channel.each do |channel_name, versions|
          site.data["versions_#{platform}_#{channel_name}"] = versions
        end
        versions_compared_by_channel_by_reference_channel.each do |reference_channel_name, versions_compared_by_channel|
          versions_compared_by_channel.each do |channel_name, versions_until_reference|
            site.data["versions_#{platform}_#{channel_name}_until_#{reference_channel_name}"] = versions_until_reference
          end
        end

        if site.layouts.key? 'version_release_notes'
          dir = site.config['update_metadata_dir'] || 'update-metadata'
          all_versions.each do |version|
            version['encompassed_versions_with_rnotes'] = version['encompassed_versions'].select { |v| v['release_notes'].count > 0 }

            encompassed_release_notes = version['encompassed_versions_with_rnotes'].map { |v| v['release_notes'] || [] }.flatten
            encompassed_release_notes.each_with_index { |v, i| v['ordinal'] = i }
            encompassed_release_notes.sort_by! { |v| -(v['importance'] || 0) * 1000 + v['ordinal'] }
            version['encompassed_release_notes'] = encompassed_release_notes

            # puts "Version #{version['version']} encompasses #{version['encompassed_versions'].count} versions, #{version['encompassed_versions_with_rnotes'].count} of them have rnotes."
            unless version['encompassed_versions_with_rnotes'].empty?

              site.pages << VersionReleaseNotesPage.new(site, site.source, dir, version)
            end
          end
        end
      end
    end
  end
end
end
