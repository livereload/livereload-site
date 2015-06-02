var { queryRow, queryValue } = require('pine2e').pg;

exports.claimLicense = claimLicense;
exports.countUnclaimedLicenses = countUnclaimedLicenses;
exports.recordBetaSignup = recordBetaSignup;

function claimLicense(ctx, params) {
  return queryRow(ctx, "UPDATE licenses SET claimed = TRUE, claimed_at = NOW(), claim_store = $1, claim_txn = $2, claim_qty = 1, claim_first_name = $3, claim_last_name = $4, claim_email = $5, claim_notes = $6, claim_full_name = $7, claim_message = $8, claim_raw = $9, claim_currency = $10, claim_price = $11, claim_coupon = $12, claim_coupon_savings = $13, claim_additional = $14, claim_country = $15, claim_sale_gross = $16, claim_sale_tax = $17, claim_processor_fee = $18, claim_earnings = $19 WHERE id IN (SELECT id FROM licenses WHERE product_code = 'LR' AND license_type = 'A' AND NOT claimed LIMIT 1) RETURNING id, license_code as \"licenseCode\";", params.store, params.txn, params.firstName || null, params.lastName || null, params.email, params.notes || '', params.fullName || null, params.message || null, params.raw || null, params.currency || null, params.price || null, params.coupon || null, params.savings || null, params.additional || null, params.country || null, params.gross || null, params.tax || null, params.fee || null, params.earnings || null);
}

function countUnclaimedLicenses(ctx) {
  return queryValue(ctx, "SELECT COUNT(*) FROM licenses WHERE product_code = 'LR' AND license_type = 'A' AND NOT claimed");
}

function recordBetaSignup(ctx, params) {
  return queryRow(ctx, "INSERT INTO beta_signups (name, email, about, app_platform, app_version) VALUES ($1, $2, $3, $4, $5) RETURNING id", params.name, params.email, params.about, params.appPlatform, params.appVersion);
}
