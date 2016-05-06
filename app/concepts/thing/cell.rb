class Thing::Cell < Cell::Concept
  include ::Cell::Haml
  include ActionView::Helpers::DateHelper
  include ::Rails::Timeago::Helper

  property :name
  property :created_at

  def show
    render
  end

  private

  def created_at
    timeago_tag(super)
  end

  def name_link
    link_to name, thing_path(model)
  end
end
