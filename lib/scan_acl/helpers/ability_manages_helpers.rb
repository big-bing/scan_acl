module ScanAcl

  module AbilityManagesHelper

    def self.module_authorize_acl(current_user, module_name)
      return true if current_user.is_admin
      ScanAcl::Ability.where(version: ScanAcl::Ability.version).exists?(module_name: module_name, id: current_user.had_ability_ids)
    end

    def self.authorize_acl(action, controller)
      action_str = "#{ controller }:#{ action }"
      abilities_check_authorization(action_str)
    end

    def self.abilities_check_authorization(action_str)
      return true if current_user.is_admin
      ScanAcl::Ability.latest_no_acl_actions.include?(action_str) || current_user.permissions.include?(action_str)
    end

  end

end
