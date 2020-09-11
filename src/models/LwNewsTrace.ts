import {Column, Entity, ManyToOne} from "typeorm";
import {BaseModel} from "./BaseModel";
import {LwNews} from "./LwNews";

@Entity({name: "lw_news_trace"})
export class LwNewsTrace extends BaseModel {
    @Column({name: "id"})
    public id: number;

    @Column({name: "partner_id"})
    public partnerId: string;

    @Column({name: "news_id"})
    public newsId: string;

    @Column({name: "read_flg"})
    public readFlg: string;

    @Column({name: "like_flg"})
    public likeFlg: string;

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
