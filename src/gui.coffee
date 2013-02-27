class Gui
  constructor: ->
  

  createElementFor: (templateId, data) =>
    source = $(templateId).html()
    template = Handlebars.compile(source)
    html = template(data)
    element = $(html)

  showFeed: (stories) =>
    element = @createElementFor("#feed-template", stories: @storiesStructure(stories))
    $(".main").append(element)

  storiesStructure: (stories) =>
    stories.map( (story) => {authorName : story.post.author.name, postContent : story.post.content})
  




  # ------
  showAskForName: =>
    
    confirmNameButton = $("#confirm-name-button")
    confirmNameButton.click( => @confirmNameButtonClicked($("#name-input").val()))
    $("#name-input").focus()
    
  confirmNameButtonClicked: (name) =>

  hideAskForName: =>
    $(".ask-for-name").remove()

  showGreetMessage: (name) =>
    element = @createElementFor("#greet-message-template", {name : name})
    $(".main").append(element)
    $("#restart-link").click( => @restartClicked())

  restartClicked: =>

  hideGreetMessage: =>
    $(".greet-message").remove()