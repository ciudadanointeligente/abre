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
print "Crear admin"

def create_user(email, username = Faker::DragonBall.character)
  pwd = 'abremunicipio895'
  User.create!(username: username, email: email, password: pwd, password_confirmation: pwd, confirmed_at: Time.current, terms_of_service: "1")
end

admin = create_user('abre@tumunicipio.org', Faker::Name.name)
admin.create_administrator
admin.update(residence_verified_at: Time.current, confirmed_phone: Faker::PhoneNumber.phone_number, document_type: "1", verified_at: Time.current, document_number: "1111111111")

def create_challenge(user, starts_at, ends_at, title = Faker::Lorem.paragraph(1, false, 2))
  Problem.create(
    title: title,
    summary: Faker::Lorem.paragraph(4, false, 4),
    call_to_action: Faker::Lorem.paragraph(1, false, 2),
    description: Faker::Lorem.paragraph(20, false, 20),
    cause: Faker::Lorem.paragraph(10, false, 10),
    consequence: Faker::Lorem.paragraph(10, false, 10),
    problem_title: Faker::Lorem.paragraph(10, false, 10),
    restriction: Faker::Lorem.paragraph(10, false, 10),
    budget: nil,
    starts_at: starts_at,
    ends_at: ends_at,
    active: true,
    status: 'Propuestas',
    geozones: Geozone.reorder("RANDOM()").limit(3),
    user: user,
    project: Project.create(
      name: Faker::Lorem.paragraph(1, false, 2),
      description: Faker::Lorem.paragraph(20, false, 20),
    ))
end


def create_proposal(challenge)
  Proposal.create!(
    author: User.reorder("RANDOM()").first,
    title: Faker::Lorem.paragraph(1, false, 1),
    summary: Faker::Lorem.paragraph(4, false, 4),
    responsible_name: Faker::Name.name,
    external_url: Faker::Internet.url,
    description: Faker::Lorem.paragraph(20, false, 10),
    created_at: rand((Time.current - 1.week) .. Time.current),
    tag_list: Faker::Lorem.words(25).sample(3).join(','),
    terms_of_service: "1",
    cached_votes_up: Faker::Number.number(2),
    geozones: challenge.geozones,
    problem: challenge)
end

def create_design_event(project, summary = Faker::Lorem.paragraph(4, false, 4), starts_at = DateTime.now - 3)
  DesignEvent.create!(
    name: Faker::Lorem.paragraph(1, false, 1),
    starts_at: starts_at,
    place: Faker::Lorem.word,
    description: Faker::Lorem.paragraph(20, false, 10),
    project: project,
    summary: summary )
end

def create_picture(image_path, image_file, design_event)
  Picture.create(
    design_event: design_event,
    image: ActionDispatch::Http::UploadedFile.new(
      filename: File.basename(image_file),
      tempfile: image_file,
      # detect the image's mime type with MIME if you can't provide it yourself.
      type: MIME::Types.type_for(image_path).first.content_type
    )
  )
end


# Desafío en etapa de propuestas, sin propuestas
challenge1 = create_challenge(admin, 2.day.ago, 12.day.from_now, "Desafío en etapa de propuestas, sin propuestas")
puts "Desafío en etapa de propuestas sin propuestas creado ✅"

# Desafío en etapa de propuestas, con propuestas
challenge2 = create_challenge(admin, 16.day.ago, 3.day.from_now, "Desafío en etapa de propuestas, con propuestas")
proposal2a = create_proposal(challenge2)
proposal2b = create_proposal(challenge2)
proposal2c = create_proposal(challenge2)
proposal2d = create_proposal(challenge2)
proposal2e = create_proposal(challenge2)
proposal2f = create_proposal(challenge2)
proposal2g = create_proposal(challenge2)
puts "Desafío en etapa de propuestas con propuestas creado ✅"


# Desafío donde el proceso de recepción y votación de propuestas ya se concluyó, pero aún no se crea un taller de diseño.
challenge3 = create_challenge(admin, 16.day.ago, 3.day.ago, "Desafío donde el proceso de recepción y votación de propuestas ya se concluyó, pero aún no se crea un taller de diseño.")
proposal3a = create_proposal(challenge3)
proposal3b = create_proposal(challenge3)
proposal3c = create_proposal(challenge3)
proposal3d = create_proposal(challenge3)
proposal3e = create_proposal(challenge3)
puts "Desafío donde el proceso de recepción y votación de propuestas ya se concluyó, pero aún no se crea un taller de diseño creado ✅"

# Desafío en etapa de talleres; en preparación del primer taller
challenge4 = create_challenge(admin, 30.day.ago, 10.day.ago, "Desafío en etapa de talleres; en preparación del primer taller")
proposal4a = create_proposal(challenge4)
proposal4b = create_proposal(challenge4)
proposal4c = create_proposal(challenge4)
proposal4d = create_proposal(challenge4)
proposal4e = create_proposal(challenge4)
designevent1a = create_design_event(challenge4.project, '')
puts "Desafío en etapa de talleres; en preparación del primer taller ✅"


# Desafío en etapa de talleres; con un taller realizado y otro no
challenge5 = create_challenge(admin, 30.day.ago, 10.day.ago, "Desafío en etapa de talleres; con un taller realizado y otro no")
proposal5a = create_proposal(challenge5)
proposal5b = create_proposal(challenge5)
proposal5c = create_proposal(challenge5)
proposal5d = create_proposal(challenge5)
designevent5a = create_design_event(challenge5.project)
imagepath5a = "#{Rails.root}/public/example/about01.png"
imagefile5a = File.new(imagepath5a)
picture5a = create_picture(imagepath5a, imagefile5a, designevent5a)
imagepath5b = "#{Rails.root}/public/example/hero01.png"
imagefile5b = File.new(imagepath5b)
picture5b = create_picture(imagepath5b, imagefile5b, designevent5a)
imagepath5c = "#{Rails.root}/public/example/about02.png"
imagefile5c = File.new(imagepath5c)
picture5c = create_picture(imagepath5c, imagefile5c, designevent5a)
designevent5a.update(pax: 14)
designevent5b = create_design_event(challenge5.project, '')
puts "Desafío en etapa de talleres; con un taller realizado y otro no ✅"


# Desafío en etapa de implementación sin reportes
challenge6 = create_challenge(admin, 30.day.ago, 10.day.ago, "Desafío en etapa de implementación, con 1 o más reportes")
designevent6a = create_design_event(challenge6.project)
challenge6.project.update(implementation_starts_at: Date.today - 4, implementation_ends_at: Date.today + 23, responsible_neighbour_name: Faker::Name.name)


# Desafío en etapa de implementación, con 1 o más reportes
challenge7 = create_challenge(admin, 30.day.ago, 10.day.ago, "Desafío en etapa de implementación, con 1 o más reportes")
designevent7a = create_design_event(challenge7.project)
challenge7.project.update(implementation_starts_at: Date.today - 4, implementation_ends_at: Date.today + 23, responsible_neighbour_name: Faker::Name.name)
report7 = Report.create(
  description: Faker::Lorem.paragraph(20, false, 20),
  project: challenge7.project
)

# Desafío (Abre B) con alternativa de propuestas (subir + levantamiento) + implementación
challenge8 = create_challenge(admin, 4.day.ago, 10.day.from_now, "Desafío (Abre B) con alternativa de propuestas (subir + levantamiento) + implementación")
challenge8.update(challenge_proposal: 1)


# Desafío (Abre C) con alternativa de talleres + implementación
challenge9 = create_challenge(admin, 4.day.ago, 10.day.from_now, "Desafío (Abre C) con alternativa de talleres + implementación")
challenge9.update(challenge_design: 1)


# Desafío en etapa de evaluación, sin evaluaciones
challenge10 = create_challenge(admin, 30.day.ago, 10.day.ago, "Desafío en etapa de evaluación, sin evaluaciones")
designevent10a = create_design_event(challenge10.project)
challenge10.project.update(implementation_starts_at: Date.today - 4, implementation_ends_at: Date.today - 1, responsible_neighbour_name: Faker::Name.name)
