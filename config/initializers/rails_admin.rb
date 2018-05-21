RailsAdmin.config do |config|

  # or something more dynamic
  config.main_app_name = Proc.new { |controller| [ "Tech", "Gyan - #{controller.params[:action].try(:titleize)}" ] }
  config.parent_controller = '::ApplicationController'
  ### Popular gems integration

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  config.authorize_with :pundit



  ## adding model 
  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end

  config.model 'Post' do 
    list do
      field :title
      field :content
      field :upvote
    end
    show do
      # e.g. include_all_fields
    end
    edit do
      field :title do
        required true        
      end
      field :content,:froala do
        required true, 
        config_options do
          {
            inlineMode: false,
            paragraphy: false
          }
        end
      end
      # e.g. include_all_fields
      # exclude_fields :website
    end
  end

  config.model 'User' do 
    list do
      field :email
    end
    show do
      field :email
      # e.g. include_all_fields
    end
    edit do
      # e.g. include_all_fields
      # exclude_fields :website
    end
  end



  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end
end
