/// Server url.
enum Url {
  /// Dev url.
  dev('https://jsonplaceholder.typicode.com'), /// http://10.1.5.207:8080

  /// Prod url.
  prod('https://jsonplaceholder.typicode.com');

  /// Url value.
  final String value;

  const Url(this.value);
}
