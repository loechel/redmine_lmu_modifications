# encoding: utf-8
#

Redmine::Plugin.register :redmine_lmu_modifications do
  name 'Redmine LMU modifications plugin'
  author 'AlphaNodes GmbH'
  description 'Customizing for LMU Redmine'
  version '0.0.3'
  author_url 'https://alphanodes.com'
end

unless ApplicationHelper.included_modules.include? RedmineLmuModifications::Patches::ApplicationHelperPatch
  ApplicationHelper.send(:include, RedmineLmuModifications::Patches::ApplicationHelperPatch)
end

# include deface overwrites
Rails.application.paths['app/overrides'] ||= []
lmu_overwrite_dir = "#{Redmine::Plugin.directory}/redmine_lmu_modifications/app/overrides".freeze
unless Rails.application.paths['app/overrides'].include?(lmu_overwrite_dir)
  Rails.application.paths['app/overrides'] << lmu_overwrite_dir
end
