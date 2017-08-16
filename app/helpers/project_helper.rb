module ProjectHelper

  def title_proposals_section(project)
    project.proposals.count > 1 ? "Propuestas iniciales" : "Propuesta inicial"
  end

  def proposals_name(project)
    string = ""
    project.proposals.each do |p|
      string += p.title
    end
    return string
  end

end
