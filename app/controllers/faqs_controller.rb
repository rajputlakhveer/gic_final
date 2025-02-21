class FaqsController < ApplicationController
  def index
    faqs = Faq.all
    half_size = (faqs.size / 2.0).ceil

    @faqs1 = faqs.limit(half_size)
    @faqs2 = faqs.offset(half_size)
  end
end
