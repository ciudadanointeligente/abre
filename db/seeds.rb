require 'database_cleaner'

DatabaseCleaner.clean_with :truncation

print "Creando configuraciones"
Setting.create(key: 'official_level_1_name', value: 'Empleados públicos')
Setting.create(key: 'official_level_2_name', value: 'Organización Municipal')
Setting.create(key: 'official_level_3_name', value: 'Directores generales')
Setting.create(key: 'official_level_4_name', value: 'Concejales')
Setting.create(key: 'official_level_5_name', value: 'Alcaldesa')
Setting.create(key: 'max_ratio_anon_votes_on_debates', value: '50')
Setting.create(key: 'max_votes_for_debate_edit', value: '1000')
Setting.create(key: 'max_votes_for_proposal_edit', value: '1000')
Setting.create(key: 'proposal_code_prefix', value: 'PROP')
Setting.create(key: 'votes_for_proposal_success', value: '100')
Setting.create(key: 'months_to_archive_proposals', value: '12')
Setting.create(key: 'comments_body_max_length', value: '1000')

Setting.create(key: 'twitter_handle', value: '@abre_dev')
Setting.create(key: 'twitter_hashtag', value: '#abre_dev')
Setting.create(key: 'facebook_handle', value: 'abre')
Setting.create(key: 'youtube_handle', value: 'abre')
Setting.create(key: 'telegram_handle', value: 'abre')

Setting.create(key: 'blog_url', value: '/blog')
Setting.create(key: 'url', value: 'https://abre.tumunicipio.org')
Setting.create(key: 'org_name', value: 'Abre')
Setting.create(key: 'municipality_name', value: 'Municipio')
Setting.create(key: 'place_name', value: 'Municipio')

#Features habilitados
Setting.create(key: 'feature.debates', value: false)
Setting['feature.debates'] = false

Setting.create(key: 'feature.polls', value: "true")
Setting['feature.polls'] = true

  # Opciones para creación de propuestas
Setting.create(key: 'feature.proposal_for_challenge', value: "true")
Setting['feature.proposal_for_challenge'] = true

Setting.create(key: 'feature.proposal_creating_problem', value: "true")
Setting['feature.proposal_creating_problem'] = false

# Login - por defecto solo esta habilitado el login con Facebook
Setting.create(key: 'feature.twitter_login', value: "false")
Setting['feature.twitter_login'] = false
Setting.create(key: 'feature.facebook_login', value: "true")
Setting['feature.facebook_login'] = true
Setting.create(key: 'feature.google_login', value: "false")
Setting['feature.google_login'] = false


Setting.create(key: 'per_page_code_head', value: "")
Setting.create(key: 'per_page_code_body', value: "")
Setting.create(key: 'comments_body_max_length', value: '1000')

# Opciones para el envio de mails
Setting.create(key: 'mailer_from_name', value: 'Abre Municipio')
Setting.create(key: 'mailer_from_address', value: 'hola@abre.tumunicipio.org')

# Opciones de web
Setting.create(key: 'meta_description', value: 'Plataforma de Participación Ciudadana y Gobierno Abierto')
Setting.create(key: 'meta_keywords', value: 'gobierno abierto, participación ciudadana')

Setting.create(key: 'verification_offices_url', value: 'https://oficinas-atencion-ciudadano.url/')

Setting.create(key: 'min_age_to_participate', value: '16')


# Home
Setting.create(key: 'home.main-title', value: "Titulo sección derecha")
Setting.create(key: 'home.main-subtitle', value: "Texto botón sección derecha")
Setting.create(key: 'home.main-subtitle-link', value: "Link de botón sección derecha")
Setting.create(key: 'home.info-epigraph', value: "Texto sobre frase principal en sección izquierda")
Setting.create(key: 'home.info-title', value: "Título sección izquierda")
Setting.create(key: 'home.info-go_to', value: "Texto primer botón sección izquierda")
Setting.create(key: 'home.info-go_to_link', value: "Link de primer botón sección izquierda")
Setting.create(key: 'home.info-go_to2', value: "Texto segundo botón sección izquierda")
Setting.create(key: 'home.info-go_to_link2', value: "Link segundo botón sección izquierda")
Setting.create(key: 'home.info-date', value: "Fechas/plazos relevantes sección izquierda")

#Proposal texts
Setting.create(key: 'section.proposal_subtitle', value: "ABRE permite a la comunidad participar de las soluciones para los problemas que la afectan. El municipio propondrá desafíos a resolver en conjunto con la comunidad, para construir soluciones participativas. En esta sección, una vez que el municipio plantee un desafío, podrás crear propuestas.")

puts " ✅"
print "Creando usuarios"

def create_user(email, username = Faker::Name.name)
  pwd = '12345678'
  User.create!(username: username, email: email, password: pwd, password_confirmation: pwd, confirmed_at: Time.current, terms_of_service: "1")
end


admin = create_user('admin@abre.dev', 'admin')
admin.create_administrator
admin.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_type: "1", verified_at: Time.current, document_number: "1111111111")

# local_admin = create_user('admin@' + Apartment::Tenant.current_tenant + '.abre.dev', 'admin')
# local_admin.create_administrator
# local_admin.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_type: "1", verified_at: Time.current, document_number: "1111111111")
#
# unless Apartment::Tenant.current_tenant == 'public'
#   #Insert seed data
# end

puts " ✅"
print "Creando categorias"

ActsAsTaggableOn::Tag.create!(name:  "Asociaciones", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Cultura", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Deportes", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Derechos Sociales", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Economía", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Empleo", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Equidad", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Sostenibilidad", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Participación", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Movilidad", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Medios", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Salud", featured: true , kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Transparencia", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Seguridad y Emergencias", featured: true, kind: "category")
ActsAsTaggableOn::Tag.create!(name:  "Medio Ambiente", featured: true, kind: "category")
