// ExampleViewController.m

#import "ExampleViewController.h"

#include <openssl/evp.h>

@implementation ExampleViewController

static void ToHex(const unsigned char* data, unsigned int length, char* buffer)
{
	static char hex[16] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
	for (unsigned i = 0; i < length; i++) {
		*buffer++ = hex[(data[i] & 0xf0) >> 4];
		*buffer++ = hex[(data[i] & 0x0f)];
	}
	*buffer = 0;
}

- (void) viewDidLoad
{
	char message[] = "I like cheese";

	OpenSSL_add_all_digests();

	const EVP_MD* md;
	unsigned char md_value[EVP_MAX_MD_SIZE];
	unsigned int md_len;	
	EVP_MD_CTX mdctx;
	
	md = EVP_get_digestbyname("SHA1");

	EVP_MD_CTX_init(&mdctx);
	EVP_DigestInit_ex(&mdctx, md, NULL);
	EVP_DigestUpdate(&mdctx, message, strlen(message));
	EVP_DigestFinal_ex(&mdctx, md_value, &md_len);
	EVP_MD_CTX_cleanup(&mdctx);

	char md_hex[(EVP_MAX_MD_SIZE * 2) + 1];
	ToHex(md_value, md_len, md_hex);	
	[[self.view.subviews objectAtIndex: 0] setText: [NSString stringWithCString: md_hex encoding: NSASCIIStringEncoding]];
}

@end
