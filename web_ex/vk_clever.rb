require 'vkontakte_api'
require 'cleverbot'

@bot = Cleverbot.new(@bot_api_user, @bot_key)
@vk = VkontakteApi::Client.new(@vk_token)

def chat?(dialog)
  return true if dialog.chat_id != nil
end

def listener
  @my_dialogs = @vk.messages.getDialogs(count: 5, items: [])
  @my_dialogs.shift

  @my_dialogs.each do |d|
    if d.read_state == 0 && d.out == 0 # сообщение входящее, не прочитано
      user = @vk.users.get(user_ids: d.uid, fields: :nickname)
      bot_answer = @bot.say d.body
      if chat? d
        @vk.messages.send(chat_id: d.chat_id, message: "#{user.first.first_name}, #{bot_answer}")
      else
        @vk.messages.send(user_ids: d.uid, message: bot_answer)
      end
    end
  end
  sleep 5
end

while true
  listener
end
