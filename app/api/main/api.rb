# in /app/main/api.rb
module Main
    class API < Grape::API
        version 'v1', using: :header, vendor: 'some_vendor'
        format :json

        resource :upload do
            post do
                # takes the :avatar value and assigns it to a variable
                avatar = params[:avatar]
                

                # the avatar parameter needs to be converted to a
                # hash that paperclip understands as:
                attachment = {
                    :filename => avatar[:filename],
                    :type => avatar[:type],
                    :headers => avatar[:head],
                    :tempfile => avatar[:tempfile]
                }

                # creates a new User object
                user = User.new

                # This is the kind of File object Grape understands so let's
                # pass the hash to it
                user.avatar = ActionDispatch::Http::UploadedFile.new(attachment)

                # easy
                user.avatar_path = attachment[:filename]

                # even easier
                user.name = "dummy name"

                # and...
                user.save
            end
        end

    end
end
