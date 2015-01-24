module AndreyTarantsov
module JekyllVersions

  class Generator < Jekyll::Generator
    def generate(site)
      ['mac'].each do |platform|
        versions_by_channel = {}

        versions = site.data["versions_#{platform}"]
        versions.each do |version|
          version['channels'].each do |channel_name, channel_enabled|
            next unless channel_enabled
            unless versions_by_channel.key? channel_name
              versions_by_channel[channel_name] = version
            end
          end
        end

        versions_by_channel.each do |channel_name, version|
          site.data["version_#{platform}_#{channel_name}"] = version
        end
      end
    end
  end
end
end
