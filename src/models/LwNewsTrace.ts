import {Column, Entity, ManyToOne, PrimaryColumn, PrimaryGeneratedColumn, ValueTransformer} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwNews} from "./LwNews";
import {IsInt} from "class-validator";

const bigIntTransformer: ValueTransformer = {
    to: (entityValue: bigint) => entityValue,
    from: (databaseValue: string) => Number(databaseValue),
};

@Entity({name: "lw_news_trace"})
export class LwNewsTrace extends BaseModel {
    @IsInt()
    @PrimaryGeneratedColumn()
    @PrimaryColumn({type: "bigint", transformer: [bigIntTransformer]})
    id!: number;

    @Column({name: "partner_id"})
    public partnerId: number;

    @Column({name: "news_id"})
    public newsId: number;

    @Column({name: "read_flg"})
    public readFlg: boolean;

    @Column({name: "like_flg"})
    public likeFlg: boolean;

    @Column({name: "create_uid"})
    public createUid: string;

    @Column({name: "create_date"})
    public createDate: Date;

    @Column({name: "write_uid"})
    public writeUid: string;

    @Column({name: "write_date"})
    public writeDate: Date;

    @ManyToOne(type => LwNews, lwNews => lwNews.lwNewsTraces)
    lwNews: LwNews

}
