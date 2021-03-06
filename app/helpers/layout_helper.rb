module LayoutHelper

  def title(page_title, show_title = "true")
    content_for(:title) { h(page_title.to_s) }
  end

  def humanize_state(state)
    case state
      when "pending"
        content_tag(:span, "You haven't paid yet for this course.")+" "+link_to( "Pay now", new_user_payment_path(current_user), :class => "btn btn-small btn-primary")
      when "active"
        "You're attending this course."
      else
        "You have #{state} this course."
    end
  end
  
  def sidebar(status) # disable the sidebar on certain pages (like the lesson show pages): Could be better :()
    style = "sidebar-true"
    content_for(:sidebar) { h(style.to_s) } if status
  end

  def welcome_text
    if user_signed_in?
      @welcome_text = raw([t('application.welcome'),current_user.full_name,content_tag(:small, t('application.greeting'))].join(" "))
    else
      @welcome_text = [t('application.welcome_to'),t('application.name')].join(" ")
    end
  end
  # Some Bootstrap helpers
  def modal_trigger(text, id, options={}) # Creates link to trigger a modal and sets up the id and data-attribute values for the _modal partial
    @id = id
    options[:data] = {:toggle => 'modal'}
    link_to text, "##{id}", options
  end

  def render_modal(header, body, id, buttons={}) # Render the _modal partial with selected options
    render :partial => 'layouts/modal', :locals => { :header => header, :body => body, :html_id => id, :buttons => buttons }
  end

# Rails helpers
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
# The embed_video method currently doesn't work. It's basically a customized video_tag helper
# that includes the ability to add in special javascript hooks that video.js uses. It will also support
# multi-language subtitle tracks based on the current ENV_LANG variable when translation is added.

# TODO: Build Custom video_tag that allows for i18n subtitles
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
