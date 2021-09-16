# frozen_string_literal: true

class SectionsReflex < ApplicationReflex
  def sort
    sections = JSON.parse(element.dataset.sections)
    count = 0
    Notification.destroy_all
    sections.each do |section|
      if section["section_type"].length > 1
        section_record = Section.find(section["id"])
        section_record.update(position: section["position"])
        count += 1
      end
    end
  end
end
