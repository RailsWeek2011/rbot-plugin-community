#xml.item :foo => 'bar' do
#  xml.title "kaka"
#end
xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do

   xml.title       "rbot-plugin-community feed"
   xml.link        url_for :only_path => false, :controller => 'plugins'
   xml.description "always be up-to-date with the 10 freshest plugins..."

   @plugins.each do |plugins|
     xml.item do
       xml.title       plugins.name
       xml.link        url_for :only_path => false, :controller => 'plugins', :action => 'show', :id => plugins.id
       xml.description plugins.summary
       xml.guid        url_for :only_path => false, :controller => 'plugins', :action => 'show', :id => plugins.id
     end
   end

 end
end

