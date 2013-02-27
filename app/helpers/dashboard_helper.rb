module DashboardHelper
  def last_threads_list(list_name)
    archive_url = "http://lists.piratenfraktion-nrw.de/pipermail/#{list_name}/"
    @doc = Nokogiri::HTML(open(archive_url)) if @doc.nil?
    current_thread_url = @doc.css("table tr:nth-child(2) td:nth-child(2) a:first-child").first["href"]
    @thread_doc = Nokogiri::HTML(open(archive_url + "/#{current_thread_url}")) rescue []

    @thread_doc.css("html body ul li a").map { |el| "<a href='#{archive_url + current_thread_url.gsub(/thread\.html/,'') + el["href"]}'>#{truncate(el.text.scan(/\[.*\](.*)/).flatten.first, :length => 25)}</a>" if el.text.length > 5 }.compact[4..8] rescue []
  end
end
