class PageWidget
  include Widget

  def show(opt={})
    @gutter = app.gutter
    app.background app.palegreen
    app.style(Shoes::Link, :underline => false, :stroke => app.blue)
    app.style(Shoes::LinkHover, :underline => true, :stroke => app.red)
  end

end
