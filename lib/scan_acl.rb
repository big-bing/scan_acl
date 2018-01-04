require "scan_acl/version"

module ScanAcl

  def self.require_all
    # model部分 要先require application_record
    require "scan_acl/models/application_record"
    require "scan_acl/models/ability_group"
    require "scan_acl/models/ability"
    require "scan_acl/models/acting"
    require "scan_acl/models/character_ability_group"
    require "scan_acl/models/character"

    # helper部分
    require "scan_acl/helpers/ability_manages_helpers"

    # controller部分
    require "scan_acl/controllers/application_controller"
    require "scan_acl/controllers/characters_controller"
  end

end
