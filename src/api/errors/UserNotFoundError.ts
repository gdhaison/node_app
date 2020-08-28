export class UserNotFoundError extends Error {
    constructor() {
        super("User not found!");
    }
    errors = [
        "blank",
        "minLength",
        "maxLength",
    ];
}
