export default class {

    // class constants

    // http methods enum
    get METHOD__GET() { return "GET" }
    get METHOD__POST() { return "POST" }
    get METHOD__PUT() { return "PUT" }
    get METHOD__PATCH() { return "PATCH" }
    get METHOD__DELETE() { return "DELETE" }

    async get(url = "127.0.0.1") {
        return this.request(this.METHOD_GET, url);
    }

    async post(url = "127.0.0.1", data = {}) {
        return this.request(this.METHOD__POST, url, JSON.stringify(data));
    }

    async request(method, url, data = "", contentType = "application/json") {
        return await fetch(url, {
            method: method,
            mode: "cors",
            credentials: "same-origin",
            headers: { "Content-Type": contentType },
            body: data
          });
    }
}