# frozen_string_literal: true

# Base model to store information about archeological sites.
class ArcheologicalSite < ActiveRecord::Base
  # Destroy the JOIN record but not the record it connects to.
  has_many :archeological_sites_ceramic_types, dependent: :destroy
  has_many :ceramic_types, through: :archeological_sites_ceramic_types

  has_many :archeological_sites_ceramic_diagnostics, dependent: :destroy
  has_many :ceramic_diagnostics,
           through: :archeological_sites_ceramic_diagnostics

  has_many :archeological_sites_previous_works, dependent: :destroy
  has_many :previous_works, through: :archeological_sites_previous_works

  has_many :archeological_sites_threats
  has_many :threats, through: :archeological_sites_threats

  has_many :maps, dependent: :destroy
  has_many :generic_files, dependent: :destroy

  accepts_nested_attributes_for :maps, allow_destroy: true
  accepts_nested_attributes_for :generic_files, allow_destroy: true
end
