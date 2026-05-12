# Examples — Domain Service

```ts
export class PricingPolicyService {
  static applyDiscount(totalCents: number, percent: number): number {
    if (percent < 0 || percent > 100) throw new Error('percent_invalid');
    return Math.round(totalCents * (1 - percent / 100));
  }
}
```

