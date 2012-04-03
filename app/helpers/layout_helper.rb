module LayoutHelper

  def title(page_title, show_title = "peanuts")
    content_for(:title) { h(page_title.to_s) }
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
# The embed_video method could be cleaned up for sure. It's basically a customized video_tag helper
# that includes the ability to add in special javascript hooks that video.js uses. It will also support
# multi-language subtitle tracks based on the current ENV_LANG variable when translation is added.
  def embed_video(object, tracks, options={})
    options.symbolize_keys!
    tracks.symbolize_keys!

    if options[:class]
      options[:class] = "video-js vjs-default-skin"
    else
      options[:class] = options[:class] + "video-js vjs-default-skin"
    end

    options[:id] = object.teaching.name if options[:id]

    controls = 'controls' if options[:controls] == 'true'

    options[:preload] = 'none' if options[:preload]

    if size = options.delete(:size)
      options[:width], options[:height] = size.split("x") if size =~ %{^\d+x\d+$}
    end

    puts "<video " + controls + options + " data-setup='{}'>"

    if object.is_a?(Array)
        object.map { |source, type| tag("source", :src => source, :type => type ) }.join.html_safe
    else
      options[:src] = path_to_video(object.teaching.url)
      puts "<source " + options[:src] + options[:type] + " />"
    end

    if false #tracks
      tracks.each do |track|
        "<track kind='captions' " + track + " />"
      end
    end

    puts "</video>"
  end

end
