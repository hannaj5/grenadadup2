# frozen_string_literal: true

# Base model to store information about archeological sites.
class ArcheologicalSite < ActiveRecord::Base
  has_and_belongs_to_many :ceramic_types
  has_and_belongs_to_many :ceramic_diagnostics
  has_and_belongs_to_many :previous_work
  has_and_belongs_to_many :threats
  
  accepts_nested_attributes_for :ceramic_types
  accepts_nested_attributes_for :ceramic_diagnostics
  accepts_nested_attributes_for :previous_work
  accepts_nested_attributes_for :threats
  
  has_many :maps
  has_many :generic_files

end
