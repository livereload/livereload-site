module AndreyTarantsov
module JekyllVersions

  class Generator < Jekyll::Generator
    REFERENCE_CHANNELS = ['production']

    def generate(site)
      ['mac'].each do |platform|
        versions_by_channel = {}
        versions_compared_by_channel_by_reference_channel = {}

        versions = site.data["versions_#{platform}"]
        versions.each do |version|
          version['channels'].each do |channel_name, channel_enabled|
            next unless channel_enabled
            unless versions_by_channel.key? channel_name
              versions_by_channel[channel_name] = version
            end
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
        end

        versions_by_channel.each do |channel_name, version|
          site.data["version_#{platform}_#{channel_name}"] = version
        end
        versions_compared_by_channel_by_reference_channel.each do |reference_channel_name, versions_compared_by_channel|
          versions_compared_by_channel.each do |channel_name, versions_until_reference|
            site.data["versions_#{platform}_#{channel_name}_until_#{reference_channel_name}"] = versions_until_reference
            puts "versions_#{platform}_#{channel_name}_until_#{reference_channel_name} = " + versions_until_reference.map { |v| v['version'] }.join(", ")
          end
        end
      end
    end
  end
end
end
