export default class {

    // class constants

    // http methods enum
    get METHOD__GET() { return "GET" }
    get METHOD__POST() { return "POST" }
    get METHOD__PUT() { return "PUT" }
    get METHOD__PATCH() { return "PATCH" }
    get METHOD__DELETE() { return "DELETE" }

    static async get(url = "127.0.0.1") {
        return this.request(this.METHOD_GET, url);
    }

    static async post(url = "127.0.0.1", data = {}) {
        return this.request(this.METHOD__POST, url, JSON.stringify(data));
    }

    static async request(method, url, data = "", contentType = "application/json") {
        return await fetch(url, {
            method: method,
            mode: "cors",
            credentials: "same-origin",
            headers: { "Content-Type": contentType },
            body: method == this.METHOD_GET ? null : data
          });
    }
}