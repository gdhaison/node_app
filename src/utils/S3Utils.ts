import AWS from "aws-sdk";
const albumBucketName = process.env.AWS_BUCKET_NAME;

const s3 = new AWS.S3({
    accessKeyId: process.env.AWS_ACCESS_KEY,
    secretAccessKey: process.env.AWS_SECRET_KEY,
    region: process.env.AWS_REGION
});

export function addPhoto(albumName: string, file: Express.Multer.File) {
    const fileName = file.originalname;
    const albumPhotosKey = encodeURIComponent(albumName) + "/";
    const photoKey = albumPhotosKey + fileName;
    const params = {
        Bucket: albumBucketName,
        Key: photoKey,
        Body: file.buffer,
        ContentType: "image/jpeg",
        ACL: "public-read-write"
    };
    s3.upload(params, (err: Error, data: any) => {
        if (err) {
            throw err;
        }
        console.log(`File uploaded successfully. ${data.Location}`);
    });
    return `${process.env.AWS_S3_BASE_URL}${photoKey}`;
}
