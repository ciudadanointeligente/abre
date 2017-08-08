module ProjectHelper

  def title_proposals_section(project)
    project.proposals.count > 1 ? "Propuestas iniciales" : "Propuesta inicial"
  end

end
