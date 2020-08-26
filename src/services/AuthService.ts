import {Service} from "typedi";
import {OrmRepository} from "typeorm-typedi-extensions";
import {ResPartnerRepository} from "../repositories/ResPartnerRepository";
import {BaseService} from "./BaseService";
import {ResPartner} from "../models/ResPartner";

@Service()
export class AuthService extends BaseService<ResPartner> {
    constructor(@OrmRepository() private userRepository: ResPartnerRepository) {
        super(ResPartner);
    }
    // public async SignIn(email: string, password: string): Promise<{ user: UserInterface; token: string }> {
    //     const userRecord = await this.userRepository.findOne({email});
    //     if (!userRecord) {
    //         throw new Error("User not registered");
    //     }
    //     /**
    //      * We use verify from argon2 to prevent 'timing based' attacks
    //      */
    //     const validPassword = await argon2.verify(userRecord.password, password);
    //     if (validPassword) {
    //         const token = this.generateToken(userRecord);
    //
    //         const user: UserInterface = {} as UserInterface;
    //         user._id = userRecord.id;
    //         user.email = userRecord.email;
    //         user.password = userRecord.password;
    //         user.salt = userRecord.password;
    //         Reflect.deleteProperty(user, "password");
    //         Reflect.deleteProperty(user, "salt");
    //         /**
    //          * Easy as pie, you don't need passport.js anymore :)
    //          */
    //         return {user, token};
    //     } else {
    //         throw new Error("Invalid Password");
    //     }
    // }
    //
    // private generateToken(user: any) {
    //     const today = new Date();
    //     const exp = new Date(today);
    //     exp.setDate(today.getDate() + 60);
    //
    //     /**
    //      * A JWT means JSON Web Token, so basically it's a json that is _hashed_ into a string
    //      * The cool thing is that you can add custom properties a.k.a metadata
    //      * Here we are adding the userId, role and name
    //      * Beware that the metadata is public and can be decoded without _the secret_
    //      * but the client cannot craft a JWT to fake a userId
    //      * because it doesn't have _the secret_ to sign it
    //      * more information here: https://softwareontheroad.com/you-dont-need-passport
    //      */
    //     return jwt.sign(
    //         {
    //             _id: user._id, // We are gonna use this in the middleware 'isAuth'
    //             role: user.role,
    //             name: user.name,
    //             exp: exp.getTime() / 1000,
    //         },
    //         "jwtSecret",
    //     );
    // }
}
