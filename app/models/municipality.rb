class Municipality < ActiveRecord::Base
  validates :subdomain, presence: true
  validates :subdomain, uniqueness: true
  validates :subdomain, length: { minimum: 3 }


  after_create :create_tenant
  after_destroy :drop_tenant

  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
      Apartment::Tenant.switch!(subdomain)
      Apartment::Tenant.current
      Apartment::Tenant.seed
    end

    def drop_tenant
      Apartment::Tenant.drop(subdomain)
    end
end
