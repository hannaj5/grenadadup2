# Tweaks and adds some active admin behaviors.
module ActiveAdmin::CustomBehavior
  def self.included(dsl)
    dsl.controller do
      # Overrides create. Picks up the Save & New form submit, and redirects to
      # the new resource form in that case. Otherwise defaults to the default
      # save behavior.

      # Disabling this cop as ActiveAdmin is goofy and not sure I can adhere
      # to the rule
      # rubocop:disable Lint/NestedMethodDefinition
      def create
        if params['commit'] == 'Save & New'
          create! { send("new_admin_#{controller_name.singularize}_path") }
        else
          super
        end
      end
      # rubocop:enable Lint/NestedMethodDefinition
    end # dsl.controller
  end # self.included(dsl)
end
