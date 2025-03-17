class Instructions {
  final String text;
  final int order;

  Instructions({
    required this.text,
    required this.order,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) {
    return Instructions(
      text: json['text'],
      order: json['order'],
    );
  }
}
