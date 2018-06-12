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
Setting.create(key: 'twitter_handle', value: '@Muni_indep')
Setting.create(key: 'twitter_hashtag', value: '#Muni_indep')
Setting.create(key: 'facebook_handle', value: 'M.Independencia')
Setting.create(key: 'youtube_handle', value: 'Independenciacl')
Setting.create(key: 'telegram_handle', value: '')
Setting.create(key: 'blog_url', value: '/blog')
Setting.create(key: 'url', value: 'https://abre.independencia.cl')
Setting.create(key: 'org_name', value: 'Abre')
Setting.create(key: 'municipality_name', value: 'Independencia')
Setting.create(key: 'place_name', value: 'City')
Setting.create(key: 'feature.debates', value: "false")
Setting.create(key: 'feature.polls', value: "true")
Setting.create(key: 'feature.spending_proposals', value: nil)
Setting.create(key: 'feature.spending_proposal_features.voting_allowed', value: nil)
Setting.create(key: 'feature.budgets', value: "false")
Setting.create(key: 'feature.twitter_login', value: "false")
Setting.create(key: 'feature.facebook_login', value: "true")
Setting.create(key: 'feature.google_login', value: "false")
Setting.create(key: 'feature.signature_sheets', value: "true")
Setting.create(key: 'per_page_code_head', value: "")
Setting.create(key: 'per_page_code_body', value: "")
Setting.create(key: 'comments_body_max_length', value: '1000')
Setting.create(key: 'mailer_from_name', value: 'Abre Independencia')
Setting.create(key: 'mailer_from_address', value: 'abre@Independencia.cl')
Setting.create(key: 'meta_description', value: 'Citizen Participation and Open Government Application')
Setting.create(key: 'meta_keywords', value: 'citizen participation, open government')
Setting.create(key: 'verification_offices_url', value: 'https://oficinas-atencion-ciudadano.url/')
Setting.create(key: 'min_age_to_participate', value: '16')

# Configuración específica a municipio
Setting.create(key: 'home_image', value: 'foto1.jpg')
Setting.create(key: 'logo', value: 'logo-independencia.svg')
Setting.create(key: 'color', value: '#004B91')

# Feature flags
Setting['feature.debates'] = false
Setting['feature.spending_proposals'] = nil
Setting['feature.polls'] = true
Setting['feature.twitter_login'] = false
Setting['feature.facebook_login'] = true
Setting['feature.google_login'] = false
Setting['feature.public_stats'] = true
Setting['feature.budgets'] = false
Setting['feature.signature_sheets'] = false

puts " ✅"
print "Crear admin"

def create_user(email, username = Faker::Name.name)
  pwd = '4br31nd3p3nd3nc14'
  User.create!(username: username, email: email, password: pwd, password_confirmation: pwd, confirmed_at: Time.current, terms_of_service: "1")
end


admin = create_user('abre@tumunicipio.org', 'admin')
admin.create_administrator
admin.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_type: "1", verified_at: Time.current, document_number: "1111111111")


puts " ✅"
print "Creating Geozones"

Geozone.create(name: "city")
Geozone.create(name: "Existent District", census_code: "01")
(1..31).each { |i| Geozone.create(name: "Unidad Vecinal #{i}", external_code: i.ord, census_code: i.ord) }
Geozone.create(name: "La Faena", external_code: 32, census_code: 32)
Geozone.create(name: "Lo Hermida", external_code: 33, census_code: 33)
Geozone.create(name: "San Luis", external_code: 34, census_code: 34)
Geozone.create(name: "Peñalolen Alto", external_code: 35, census_code: 35)
Geozone.create(name: "Peñalolen Nuevo", external_code: 36, census_code: 36)

moderator = create_user('mod@consul.dev', 'mod')
moderator.create_moderator

manager = create_user('manager@consul.dev', 'manager')
manager.create_manager

valuator = create_user('valuator@consul.dev', 'valuator')
valuator.create_valuator

poll_officer = create_user('poll_officer@consul.dev', 'Paul O. Fisher')
poll_officer.create_poll_officer

level_2 = create_user('leveltwo@consul.dev', 'level 2')
level_2.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_number: "2222222222", document_type: "1" )

verified = create_user('verified@consul.dev', 'verified')
verified.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_type: "1", verified_at: Time.current, document_number: "3333333333")

(1..10).each do |i|
  org_name = Faker::Company.name
  org_user = create_user("org#{i}@consul.dev", org_name)
  org_responsible_name = Faker::Name.name
  org = org_user.create_organization(name: org_name, responsible_name: org_responsible_name)

  verified = [true, false].sample
  if verified then
    org.verify
  else
    org.reject
  end
end

(1..5).each do |i|
  official = create_user("official#{i}@consul.dev")
  official.update(official_level: i, official_position: "Official position #{i}")
end

(1..40).each do |i|
  user = create_user("user#{i}@consul.dev")
  level = [1, 2, 3].sample
  if level >= 2
    user.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_number: Faker::Number.number(10), document_type: "1" )
  end
  if level == 3
    user.update(verified_at: Time.current, document_number: Faker::Number.number(10) )
  end
end

org_user_ids = User.organizations.pluck(:id)
not_org_users = User.where(['users.id NOT IN(?)', org_user_ids])

puts " ✅"
print "Creating Tags Categories"

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

# puts " ✅"
# print "Creating Debates"
#
# tags = Faker::Lorem.words(25)
# (1..30).each do
#   author = User.reorder("RANDOM()").first
#   description = "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>"
#   debate = Debate.create!(author: author,
#                           title: Faker::Lorem.sentence(3).truncate(60),
#                           created_at: rand((Time.current - 1.week) .. Time.current),
#                           description: description,
#                           tag_list: tags.sample(3).join(','),
#                           geozone: Geozone.reorder("RANDOM()").first,
#                           terms_of_service: "1")
# end


# tags = ActsAsTaggableOn::Tag.where(kind: 'category')
# (1..30).each do
#   author = User.reorder("RANDOM()").first
#   description = "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>"
#   debate = Debate.create!(author: author,
#                           title: Faker::Lorem.sentence(3).truncate(60),
#                           created_at: rand((Time.current - 1.week) .. Time.current),
#                           description: description,
#                           tag_list: tags.sample(3).join(','),
#                           geozone: Geozone.reorder("RANDOM()").first,
#                           terms_of_service: "1")
# end


puts " ✅"

problem = Problem.create(title: "Tus ideas comunitarias para la prevención del delito",
  summary: "Por medio de este desafío invitamos a la comunidad a crear propuestas que permitan prevenir el delito mediante iniciativas sociocomunitarias. Es decir, instancias que promuevan la participación vecinal y que articulen a la comunidad en torno a la seguridad del barrio.",
  call_to_action: "Invitamos a todas y todos los vecinos de Independencia a proponer medidas para la prevención del delito construidas colaborativamente.",
  status: 'Propuestas',
  description: "Por medio de este desafío invitamos a la comunidad a crear propuestas que permitan prevenir el delito mediante iniciativas sociocomunitarias. Es decir, instancias que promuevan la participación vecinal y que articulen a la comunidad en torno a la seguridad del barrio.

Las iniciativas socio comunitarias pueden implicar, por ejemplo, actividades con tus vecinos, ocupación del espacio público, recuperación de espacios abandonados o usos innovadores de tecnologías ya existentes.

A través de las cuatro etapas que contempla el programa, Abre se invitará a los vecinos a cocrear, en conjunto con el municipio, soluciones para prevenir el delito. Primero se realizará durante 4 semanas un levantamiento de propuestas, y votación de estas.",
  id: 3,
  budget: nil,
  restriction: nil,
  starts_at: 1.day.ago,
  ends_at: 10.day.from_now,
  active: true,
  geozones: Geozone.reorder("RANDOM()").limit(3),
  user: admin,
  cause: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  consequence: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  problem_title: "Tus ideas comunitarias para la prevención del delito",
  restriction: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  project: Project.create(name: "Tus ideas comunitarias para la prevención del delito",
    description: "Por medio de este desafío invitamos a la comunidad a crear propuestas que permitan prevenir el delito mediante iniciativas sociocomunitarias. Es decir, instancias que promuevan la participación vecinal y que articulen a la comunidad en torno a la seguridad del barrio.",
    starts_at: "2017-03-28 22:00:00",
    ends_at: "2017-06-24 22:00:00",
    proposals: Proposal.all,
    implementation_starts_at: Date.today,
    implementation_ends_at: Date.today + 3.month,
    responsible_neighbour_name: Faker::Name.name,
  ))


puts " ✅"






puts "All dev seeds created successfuly 👍"
