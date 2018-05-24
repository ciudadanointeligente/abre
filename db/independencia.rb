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
