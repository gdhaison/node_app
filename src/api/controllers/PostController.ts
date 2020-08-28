import {Controller, Get} from "routing-controllers";

// import {Authentication, Authorization} from "../../middlewares";

@Controller()
// @UseBefore(Authentication)
// @UseAfter(Authorization)
export class PostController {
    @Get("/posts")
    getAll() {
        return "This action returns all posts";
    }
}
