# frozen_string_literal: true

# Base model to store information about archaeological sites.
class ArchaeologicalSite < ActiveRecord::Base
  
  has_paper_trail
  
  # Destroy the JOIN record but not the record it connects to.
  has_many :archaeological_sites_ceramic_types, dependent: :destroy
  has_many :ceramic_types, through: :archaeological_sites_ceramic_types

  has_many :archaeological_sites_ceramic_diagnostics, dependent: :destroy
  has_many :ceramic_diagnostics,
           through: :archaeological_sites_ceramic_diagnostics

  has_many :archaeological_sites_previous_works, dependent: :destroy
  has_many :previous_works, through: :archaeological_sites_previous_works

  has_many :archaeological_sites_threats
  has_many :threats, through: :archaeological_sites_threats

  has_many :maps, dependent: :destroy
  has_many :generic_files, dependent: :destroy

  accepts_nested_attributes_for :maps, allow_destroy: true
  accepts_nested_attributes_for :generic_files, allow_destroy: true
  
  def next
    site = ArchaeologicalSite.where("id > ?", self.id).first
    site = ArchaeologicalSite.first if site.nil?
    site
  end
  
  def previous
    site = ArchaeologicalSite.where("id < ?", self.id).last
    site = ArchaeologicalSite.last if site.nil?
    site
  end
end
