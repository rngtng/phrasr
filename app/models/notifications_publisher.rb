class NotificationsPublisher < Facebooker::Rails::Publisher
  include ApplicationHelper 

  def attack_notification(attack) 
    send_as :notification 
    recipients attack.defending_user 
    from attack.attacking_user.facebook_session.user 

    fbml <<- MESSAGE 
    <fb:fbml> 
    #{attack_result(attack) } 
    #{name attack.defending_user} with a #{attack.move.name}. 
    #{link_to "Attack them back!", new_attack_url} 
    </fb:fbml> 
    MESSAGE 
  end 

  def attack_feed(attack) 
    send_as :action 
    from attack.attacking_user.facebook_session.user 

    title <<- TITLE 
    <fb:fbml> 
    #{attack_result(attack) } 
    #{name attack.defending_user} with a #{attack.move.name}. 
    #{link_to "Join the fight!", new_attack_url} 
    </fb:fbml> 
    TITLE 

    body <<- BODY 
    <fb:fbml> 
    #{name attack.attacking_user} is 
    a #{attack.attacking_user.belt.name} 
    belt. 
    </fb:fbml> 
    BODY 
    add_image(image_path(attack.move.image_name),new_attack_url) 
  end

  def templatized_attack_feed(attack) 
    send_as :templatized_action 
    from attack.attacking_user.facebook_session.user 

    title_data :result=>attack_result(attack),  :move=>attack.move.name, :defender=>name(attack.defending_user) 

    title_template <<- TITLE 
    <fb:fbml> 
    {actor} {result} 
    {defender} with a {move}. 
    #{link_to "Attack them back!", new_attack_url} 
    </fb:fbml> 
    TITLE 

    body_general <<- BODY_GENERAL 
    #{name attack.attacking_user} 
    #{attack_result(attack)} 
    #{name attack.defending_user} 
    with a #{attack.move.name} 
    BODY_GENERAL 
  end 

  def new_belt_notification(user) 
    send_as :story 
    recipients user.facebook_session.user 

    title <<- TITLE 
    Congratulations! Youve earned a #{user.belt.name} belt. 
    #{link_to "Try out your new moves",new_attack_url} 
    TITLE 

  end 
end
