update(event) {
  event.preventDefault();
  const url = this.formTarget.action
  fetch(url, {
    method: 'PATCH',
    headers: { 'Accept': 'text/html' },
    body: new FormData(this.formTarget)
  })
    .then(response => response.text())
    .then((data) => {
      console.log(data);
    })
}
