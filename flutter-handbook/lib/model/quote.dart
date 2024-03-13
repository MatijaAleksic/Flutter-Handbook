class Quote{
  String? text;
  String? author;

  //UNNAMED PARAMETERS
  // Quote(String text, String author){
  //   this.text = text;
  //   this.author = author;
  // }
  //INITIALIZATION
  // Quote unnamedQuote = Quote("text", "author");

  //NAMED PARAMETERS

  Quote({String? text, String? author}){
    this.text = text;
    this.author = author;
  }
  //ILI

  // Quote({required this.quote, required this.delete});

  //INITIALIZATION
  // Quote namedQuote = Quote(author: "author", text: "text" );

  //ILI

  // Quote.named(this.text, this.author);
  //INITIALIZATION
  // Quote myQuote = Quote.named("This is a quote", "John Doe");
}

