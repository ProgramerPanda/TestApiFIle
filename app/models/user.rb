class User < ActiveRecord::Base
    attr :name, :avatar_path, :avatar

    #mount_base64_uploader :avatar, ImageUploader

    has_attached_file :avatar, :path => ":rails_root/public/avatars/:filename"
     #do_not_validate_attachment_file_type :avatar
    #validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

    #validates_attachment_content_type :avatar,
                                  #  :content_type => /^image\/(png|gif|jpeg)/,
                                  #  :message => 'only (png/gif/jpeg) images'
end
