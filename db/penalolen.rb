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

Setting.create(key: 'twitter_handle', value: '@consul_dev')
Setting.create(key: 'twitter_hashtag', value: '#consul_dev')
Setting.create(key: 'facebook_handle', value: 'consul')
Setting.create(key: 'youtube_handle', value: 'consul')
Setting.create(key: 'telegram_handle', value: 'consul')
Setting.create(key: 'blog_url', value: '/blog')
Setting.create(key: 'url', value: 'https://abre.penalolen.cl')
Setting.create(key: 'org_name', value: 'Abre')
Setting.create(key: 'municipality_name', value: 'Peñalolen')
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
Setting.create(key: 'mailer_from_name', value: 'Abre Peñalolen')
Setting.create(key: 'mailer_from_address', value: 'abre@penalolen.cl')
Setting.create(key: 'meta_description', value: 'Citizen Participation and Open Government Application')
Setting.create(key: 'meta_keywords', value: 'citizen participation, open government')
Setting.create(key: 'verification_offices_url', value: 'https://oficinas-atencion-ciudadano.url/')
Setting.create(key: 'min_age_to_participate', value: '16')

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

# Home
Setting.create(key: 'home.main-title', value: "Construyamos soluciones para nuestra comuna")
Setting.create(key: 'home.main-subtitle', value: "Quiero saber más")
Setting.create(key: 'home.main-subtitle-link', value: "https://abre.penalolen.cl/more-information")
Setting.create(key: 'home.info-epigraph', value: "Recepción de propuestas")
Setting.create(key: 'home.info-title', value: "Parque de ideas: Soñemos en conjunto el Parque San Luis.")
Setting.create(key: 'home.info-go_to', value: "Quiero subir una propuesta")
Setting.create(key: 'home.info-go_to_link', value: "http://abre.penalolen.cl/proposals/new")
Setting.create(key: 'home.info-go_to2', value: "Quiero subir una propuesta")
Setting.create(key: 'home.info-go_to_link2', value: "http://abre.penalolen.cl/proposals/new")
Setting.create(key: 'home.info-date', value: "17 DE JULIO - 15 DE AGOSTO")

puts " ✅"
print "Creando unidades vecinales y zonas"


(1..31).each { |i| Geozone.create(name: "Unidad Vecinal #{i}", population: 3000, external_code: i.ord, census_code: i.ord) }
Geozone.create(name: "La Faena", population: 15000, external_code: 32, census_code: 32)
Geozone.create(name: "Lo Hermida", population: 45000, external_code: 33, census_code: 33)
Geozone.create(name: "San Luis", population: 44000, external_code: 34, census_code: 34)
Geozone.create(name: "Peñalolen Alto", population: 57000, external_code: 35, census_code: 35)
Geozone.create(name: "Peñalolen Nuevo", population: 70000, external_code: 36, census_code: 36)



puts " ✅"
print "Creando usuarios"

def create_user(email, username = Faker::Name.name)
  pwd = '12345678'
  User.create!(username: username, email: email, password: pwd, password_confirmation: pwd, confirmed_at: Time.current, terms_of_service: "1")
end


admin = create_user('admin@consul.dev', 'admin')
admin.create_administrator
admin.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_type: "1", verified_at: Time.current, document_number: "1111111111")

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

verified2 = create_user('unverified@consul.dev', 'unverified')


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

(1..3).each do |i|
  official = create_user("official#{i}@consul.dev")
  official.update(official_level: i, official_position: "Official position #{i}")
end

(1..3).each do |i|
  user = create_user("user#{i}@consul.dev")
  level = [1, 2, 3].sample
  if level >= 1
    user.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_number: Faker::Number.number(10), document_type: "1" )
  end
end

org_user_ids = User.organizations.pluck(:id)
not_org_users = User.where(['users.id NOT IN(?)', org_user_ids])

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


puts " ✅"
print "Creando un desafío y un problema"

problem = Problem.create(title: "Mejoramiento Parque San Luis",
  summary: "Actualmente el Parque San Luis no está siendo útil para los vecinos ya que no cumple con las necesidades y expectativas de estos.",
  call_to_action: "Invitamos a los vecinos a proponer acerca de cómo quieren el Parque San Luis",
  description: "El Parque San Luis, ubicado en la Unidad Vecinal 23, ha sido desde hace muchos años un lugar donde los vecinos de la comuna se congregan. Pero, a pesar de ello, no esta satisfaciendo las necesidades actuales de los vecinos, que a través de las mesas barriales han manifestado su interés por mejorar este, con la finalidad que las familias se puedan congregar en este espacio.",
  id: 3,
  budget: "$60.000.000",
  restriction: nil,
  starts_at: 1.day.ago,
  ends_at: 1.day.ago,
  active: true,
  geozones: Geozone.reorder("RANDOM()").limit(3),
  user: admin,
  cause: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  consequence: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  problem_title: "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
  restriction: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )

  problem2 = Problem.create(title: "Muchos perros callejeros en mi barrio",
  cause: "Las causas de que haya muchos perros callejeros son:
1.- Poca capacidad en perreras municipales
2.- Muchos perros no esterilizados
3.- Poca educación sobre tenencia responsable de animales",
  consequence: "1.- Plazas con perros agresivos que pueden morder a niños
2.- Mi barrio está sucio y poco salubre con fecas
3.- Perros sufren y tienen muy mala salud por tener que vivir en la calle",
  user: admin,
  call_to_action: "Crea propuestas",
  starts_at: 1.day.ago,
  ends_at: 10.day.from_now,
  description: "Description",
  summary: "Summary",
  geozones: Geozone.reorder("RANDOM()").limit(1) )

puts ""

puts " ✅"
print "Creando propuestas"

tags = Faker::Lorem.words(25)

proposal0 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Tenencia responsable de animales para ambientes más sanos y seguros",
                            question: "¿Quieres que se promueva la tenencia resonsable?",
                            summary: "Tenencia responsable de animales para ambientes más sanos y seguros",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "Para que haya menos perros callejeros se debe partir por tener más educación sobre tenencia responsable de animales. Es por esto que creo que la municipalidad se debe coordinar con las juntas de vecinos para que les haga talleres de tenencia responsable de animales, junto con hacer esterilizaciones masivas y gratis. Esto ayudará a que los barrios no estén llenos de fecas de perro y perros callejeros teniendo espacios más limpios y seguros para los niños y niñas de Peñalolén.",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            terms_of_service: "1",
                            problem: problem2,
                            geozones: problem2.geozones,
                            cached_votes_up: Setting["votes_for_proposal_success"])


proposal0b = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Tenencia responsable de animales para ambientes más sanos y seguros",
                            question: "¿Quieres que se promueva la tenencia resonsable?",
                            summary: "Tenencia responsable de animales para ambientes más sanos y seguros",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "Para que haya menos perros callejeros se debe partir por tener más educación sobre tenencia responsable de animales. Es por esto que creo que la municipalidad se debe coordinar con las juntas de vecinos para que les haga talleres de tenencia responsable de animales, junto con hacer esterilizaciones masivas y gratis. Esto ayudará a que los barrios no estén llenos de fecas de perro y perros callejeros teniendo espacios más limpios y seguros para los niños y niñas de Peñalolén.",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            terms_of_service: "1",
                            geozones: problem2.geozones,
                            problem: problem2)


proposal1 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Quinchos en el Parque San Luis",
                            question: "¿Quieres agregar quinchos al Parque San Luis?",
                            summary: "Agregar al menos 5 quinchos con mesas para que los vecinos puedan juntarse a compartir",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            terms_of_service: "1",
                            problem: problem,
                            geozones: problem.geozones,
                            for_challenge: true,
                            cached_votes_up: 75)

proposal2 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Mejorar la cancha",
                            question: "¿Quieres mejorar la cancha?",
                            summary: "Se busca comprar arcos de fútbol y mejorar la cancha para que esta sea realmente útil",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            for_challenge: true,
                            geozones: problem.geozones,
                            terms_of_service: "1",
                            problem: problem,
                            cached_votes_up: 33)

proposal3 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Crear un huerto",
                            question: "¿Quieres crear un huerto en el Parque?",
                            summary: "La idea es crear un huerto, donde todos puedan tener un espacio donde plantar",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            for_challenge: true,
                            terms_of_service: "1",
                            problem: problem,
                            geozones: problem.geozones,
                            cached_votes_up: 74)

proposal4 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Crear un espacio cultural en el espacio del Parque",
                            question: "¿Te gustaría crear un espacio culturan?",
                            summary: "La finalidad es que el Parque pueda ser utilizado en todo momento, incluso cuando llueve. Generando este espacio se podría tener esto, y potenciar las actividades culturales organizadas por los vecinos",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            terms_of_service: "1",
                            problem: problem,
                            for_challenge: true,
                            cached_votes_up: 74)

proposal5 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "Crear una zona de juegos para perros",
                            question: "¿Quieres crear una zona para ir con tu perro?",
                            summary: "Crear un espacio donde uno pueda ir con su perro y practicar con él. Esto crea un espacio donde muchos pueden compartir un gusto en común.",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                            created_at: rand((Time.current - 1.week) .. Time.current),
                            tag_list: tags.sample(3).join(','),
                            terms_of_service: "1",
                            problem: problem,
                            geozones: problem.geozones,
                            for_challenge: true,
                            cached_votes_up: 89)

proposal6 = Proposal.create!(author: User.reorder("RANDOM()").first,
                            title: "PASADA - Crear una zona de juegos para perros",
                            question: "¿Quieres crear una zona para ir con tu perro?",
                            summary: "Crear un espacio donde uno pueda ir con su perro y practicar con él. Esto crea un espacio donde muchos pueden compartir un gusto en común.",
                            responsible_name: Faker::Name.name,
                            external_url: Faker::Internet.url,
                            description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                            tag_list: tags.sample(3).join(','),
                            terms_of_service: "1",
                            problem: problem,
                            for_challenge: true,
                            geozones: problem.geozones,
                            created_at: 8.month.ago,
                            cached_votes_up: 74)

puts " ✅"
print "Creando Proyecto"

project = Project.create(name: "Mejoramiento plaza San Luis con Quinchos",
  description: "Durante 3 semanas los vecinos de Peñalolen, de la unidad vecinal de la Unidad Vecinal 23, levantaron propuestas para mejorar el parque San Luis. Durante este tiempo los vecinos también tuvieron la posibilidad de apoyar diferentes propuestas. La",
  id: 3,
  starts_at: "2017-03-28 22:00:00",
  ends_at: "2017-06-24 22:00:00",
  proposal: proposal1)

puts " ✅"
print "Creating polls"

puts " ✅"
print "Active Polls"
(1..2).each do |i|
  poll = Poll.create(name: "Active Poll #{i}",
                     starts_at: 1.month.ago,
                     ends_at:   1.month.from_now,
                     description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                     geozone_restricted: false)
end

(3..4).each do |i|
  poll = Poll.create(name: "Active Poll #{i}",
                     starts_at: 1.month.ago,
                     ends_at:   1.month.from_now,
                     geozone_restricted: true,
                     description: "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>",
                     geozones: Geozone.reorder("RANDOM()").limit(3)
                    )
end





puts " ✅"
print "Upcoming Poll"
poll = Poll.create(name: "Upcoming Poll",
                   starts_at: 1.month.from_now,
                   ends_at:   2.months.from_now)

puts " ✅"
print "Expired Poll"
poll = Poll.create(name: "Expired Poll",
                     starts_at: 2.months.ago,
                     ends_at:   1.months.ago)

puts " ✅"

print "Creating Poll Questions"

(1..10).each do |i|
  poll = Poll.reorder("RANDOM()").first
  author = User.reorder("RANDOM()").first
  description = "<p>#{Faker::Lorem.paragraphs.join('</p><p>')}</p>"
  open_at = rand(2.months.ago .. 2.months.from_now)
  question = Poll::Question.create!(author: author,
                                    title: Faker::Lorem.sentence(3).truncate(60),
                                    description: description,
                                    valid_answers: Faker::Lorem.words((2..7).to_a.sample).join(', '),
                                    poll: poll)
end

# puts " ✅"
# print "Creating Poll Booths"
# 30.times.each_with_index do |i|
#   Poll::Booth.create(name: "Booth #{i}", polls: [Poll.all.sample])
# end
#
# puts " ✅"
# print "Creating Booth Assignments"
# Poll::Booth.all.each do |booth|
#   Poll::BoothAssignment.create(booth: booth, poll: Poll.all.sample)
# end
#
# puts " ✅"
# print "Creating Poll Officer Assignments"
# (1..15).to_a.sample.times do |i|
#   Poll::BoothAssignment.all.sample(i).each do |booth_assignment|
#     Poll::OfficerAssignment.create(officer: poll_officer.poll_officer,
#                                    booth_assignment: booth_assignment,
#                                    date: booth_assignment.poll.starts_at)
#   end
# end
#
# puts " ✅"
# print "Creating Poll Recounts" do
# (1..15).to_a.sample.times do |i|
#   poll_officer.poll_officer.officer_assignments.all.sample(i).each do |officer_assignment|
#     Poll::Recount.create(officer_assignment: officer_assignment,
#                          booth_assignment: officer_assignment.booth_assignment,
#                          date: officer_assignment.date,
#                          count: (1..5000).to_a.sample)
#   end
# end
#
# end
#
# puts " ✅"
# print "Creating Poll Questions from Proposals"
#
# (1..3).each do
#   proposal = Proposal.reorder("RANDOM()").first
#   poll = Poll.current.first
#   question = Poll::Question.create(valid_answers: "Yes, No")
#   question.copy_attributes_from_proposal(proposal)
#   question.save!
# end
#
# puts " ✅"
# print "Creating Successful Proposals"
#
# (1..10).each do
#   proposal = Proposal.reorder("RANDOM()").first
#   poll = Poll.current.first
#   question = Poll::Question.create(valid_answers: "Yes, No")
#   question.copy_attributes_from_proposal(proposal)
#   question.save!
# end
#
# puts " ✅"
# print "Commenting Poll Questions"
#
# (1..30).each do
#   author = User.reorder("RANDOM()").first
#   question = Poll::Question.reorder("RANDOM()").first
#   Comment.create!(user: author,
#                   created_at: rand(question.created_at .. Time.current),
#                   commentable: question,
#                   body: Faker::Lorem.sentence)
# end
#
# puts " ✅"
# print "Creating Poll Voters"
#
# (1..10).each do
#   poll = Poll.all.sample
#   user = User.level_two_verified.sample
#   Poll::Voter.create(poll: poll, user: user)
# end

# puts " ✅"
puts "All dev seeds created successfuly 👍"
