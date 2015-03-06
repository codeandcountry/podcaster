class Episode < ActiveRecord::Base
  belongs_to :feed
  has_attached_file :mp3, {
    # Choose the FTP storage backend
    :storage => :ftp,

    :path => "/:filename",

    # The full URL of where the attachment is publicly accessible.
    # This supports Paperclip::Interpolations.
    :url => "http://www.codeandcountry.com/uploadtest/:filename",

    # The list of FTP servers to use
    :ftp_servers => [
      {
        :host     => "ftp.codeandcountry.com",
        :user     => "test@flashharris.com",
        :password => "uploadtest"
      }
    ]
  }

  validates_attachment :mp3, content_type: { content_type: ["audio/mpeg3", "audio/x-mpeg-3", "image/png"] } 

  def url
    if feed.uses_podtrac
      "http://www.podtrac.com/pts/redirect.mp3/#{read_attribute(:url)}"
    else
      read_attribute(:url)
    end
  end
end
