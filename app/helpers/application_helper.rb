module ApplicationHelper
  class HTMLwithAlbino < Redcarpet::Render::HTML
    def block_code(code, language)
      Albino.colorize(code, language)
    end
  end

  def markdown(text)
    renderer = Redcarpet::Markdown.new(HTMLwithAlbino,
                                       tables: true,
                                       footernotes: true,
                                       fenced_code_blocks: true)
    renderer.render(text)
  end
end
