require 'ym_core'
require "ym_moderation/engine"

module YmModeration
end

Dir[File.dirname(__FILE__) + '/ym_moderation/models/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/ym_moderation/controllers/*.rb'].each {|file| require file }