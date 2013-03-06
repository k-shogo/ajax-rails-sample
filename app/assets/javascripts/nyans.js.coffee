jQuery ->
  $('.best_in_place').best_in_place()

$ ->
  $('#nyans')
    .on 'ajax:complete', '.delete_nyan', (event, ajax, status) ->
      alert 'nyan!'
      # 項目を削除
      $(this).closest('.nyan').remove()
  $('#nyan')
    .on 'ajax:complete', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      html = response.html
      # 画面に追加
      $('#nyans').append html
      # フォームを初期化
      $(this)[0].reset()
