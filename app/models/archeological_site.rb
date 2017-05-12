# frozen_string_literal: true

# Base model to store information about archeological sites.
class ArcheologicalSite < ActiveRecord::Base
  has_and_belongs_to_many :ceramic_types
  has_and_belongs_to_many :ceramic_diagnostics
  has_and_belongs_to_many :previous_work
  has_and_belongs_to_many :threats
  
  has_many :maps
  has_many :generic_files
end
