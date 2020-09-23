import {DeleteResult, getConnection, IsNull, Repository} from "typeorm";
import {BaseModel} from "../models/BaseModel";

export type ObjectType<T> = { new(): T } | Function;
export type listForm<T> = Promise<[T[], number]> | Promise<T[]>;
const listForm = Promise;

export abstract class BaseService<T extends BaseModel> {
    protected genericRepository: Repository<T>;
    private repo: ObjectType<T>;

    protected constructor(repo: ObjectType<T>) {
        this.genericRepository = getConnection().getRepository(repo);
        this.repo = repo;
    }
    //
    // async list(relations?: string[], skip?: number, take?: number): Promise<(T[] | number)[]> {
    //     if ((take || take === 0) && (skip || skip === 0)) {
    //         const list = await this.genericRepository.findAndCount({
    //             order: {createDate: "DESC"},
    //             where: {deletedAt: IsNull()},
    //             relations,
    //             take,
    //             skip,
    //         });
    //         return list;
    //     } else {
    //         const blist = await (this.genericRepository.find({
    //             relations,
    //         }) as Promise<T[]>);
    //
    //         const array = [blist, blist.length];
    //         return array;
    //     }
    // }
    //
    // async getById(id: number, relations?: string[]): Promise<T> {
    //     return this.genericRepository.findOne({
    //         where: {id},
    //         relations,
    //     }) as Promise<T>;
    // }
    //
    // async getByWhere(
    //     where: [] | {},
    //     relations?: string[],
    //     skip?: number,
    //     take?: number,
    // ): Promise<listForm<T>> {
    //     if ((take || take === 0) && (skip || skip === 0)) {
    //         const list = await this.genericRepository.findAndCount({
    //             where,
    //             order: {createdAt: "DESC"},
    //             relations,
    //             take,
    //             skip,
    //         });
    //
    //         return list;
    //     } else {
    //         const get = await this.genericRepository.find({
    //             where,
    //             relations,
    //         });
    //         return get;
    //     }
    // }
    //
    // async hardDelete(id: number): Promise<DeleteResult> {
    //     return getConnection()
    //         .createQueryBuilder()
    //         .delete()
    //         .from(this.repo)
    //         .where("id = :id", {id})
    //         .execute();
    // }
    //
    // async softDelete(id: number): Promise<T> {
    //     const oldOne = await (this.getById(id) as Promise<T>);
    //     const newOne: Partial<T> = {};
    //     return this.genericRepository.save({...oldOne, ...newOne} as object);
    // }
}
