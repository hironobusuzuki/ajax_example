# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # <2>-data にパーシャルの render 結果が入っているのでjqueryで書き換え
  $('.edit_link').on
    'ajax:success': (e, data) ->
      $(this).parent("div").html(data).children("form").on
        'ajax:success': (e, data) ->
          $("#name#{data.id}").html(data.name)
          $("#price#{data.id}").html(data.price)
          $("#description#{data.id}").html(data.description)
          link = "<a class='edit_link' data-remote='true' href=\'items/#{data.id}/edit2\'>Ajax Edit(no use js.erb)</a>"
          $("#edit2_#{data.id}").html(link)
          #TODO 冗長過ぎる
          $('.edit_link').on
            'ajax:success': (e, data) ->
              $(this).parent("div").html(data).children("form").on
                'ajax:success': (e, data) ->
                  $("#name#{data.id}").html(data.name)
                  $("#price#{data.id}").html(data.price)
                  $("#description#{data.id}").html(data.description)
                  link = "<a class='edit_link' data-remote='true' href=\'items/#{data.id}/edit2\'>Ajax Edit(no use js.erb)</a>"
                  $("#edit2_#{data.id}").html(link)
