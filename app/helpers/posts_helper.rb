module PostsHelper
  def render_highlight_title(post, query_string)
    excerpt_cont = excerpt(post.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

  def render_highlight_content(post, query_string)
    excerpt_cont = excerpt(post.content, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end
end
