module YmModeration::FlagsHelper

  def flag_link(*args)
    options = args.extract_options!
    link_text, resource = args.length > 1 ? [args[0], args[1]] : ['Report', args[0]]
    url = new_flagging_path(:resource_type => resource.class.to_s, :resource_id => resource.id)
    link_to(link_text, url, options.merge(:remote => true, :class => 'flag-link'))
  end

end