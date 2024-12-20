<?php

namespace Cryptobook\Domain\Contract\Event;

interface DomainEvent
{
    public function eventName(): string;

    public function occurredOn(): \DateTimeImmutable;

    public function toPrimitives(): array;
}